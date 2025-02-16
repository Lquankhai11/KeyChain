using System.Diagnostics;
using KeyChain.Helper;
using KeyChain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KeyChain.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly KeychainContext _context;
        public HomeController(ILogger<HomeController> logger, KeychainContext context)
        {
            _logger = logger;
            _context = context;
        }
        [Route("Home/HomePage/{code}")]
        public IActionResult HomePage(string code)
        {
            if (string.IsNullOrEmpty(code))
            {
                return BadRequest("Hãy quét lại NFC trên móc khóa của bạn.");
            }
            string productCode;
            try
            {
                productCode = MyEncryptionHelper.Decrypt(code);
            }
            catch (Exception ex)
            {
                _logger.LogError("Lỗi giải mã mã sản phẩm: " + ex.Message);
                return BadRequest("Mã sản phẩm không hợp lệ.");
            }

            var productExists = _context.Products.Include(p=>p.KeyImage).FirstOrDefault(p => p.ProductCode == productCode);
            ViewBag.KeyImage = productExists?.KeyImage?.Image1;
            if (productExists==null)
            {
                return NotFound("Mã sản phẩm không tồn tại.");
            }
            var randomAnswer = _context.RandomAnswers.OrderBy(x => Guid.NewGuid()).Select(r =>r.Answer).FirstOrDefault();
            ViewBag.Answer = randomAnswer ?? "Cạn lời rùi!";
            return View();
        }

        [HttpGet]
        public IActionResult GenerateCode()
        {
            return View();
        }

        [HttpPost]
        public IActionResult GenerateCode(string plainText)
        {
            if (string.IsNullOrWhiteSpace(plainText))
            {
                ViewBag.Error = "Vui lòng nhập dữ liệu cần mã hóa.";
                return View();
            }

            var encryptedText = MyEncryptionHelper.Encrypt(plainText);
            ViewBag.EncryptedText = encryptedText;
            ViewBag.OriginalText = plainText;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
