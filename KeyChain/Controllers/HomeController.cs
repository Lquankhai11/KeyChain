using System.Diagnostics;
using KeyChain.Models;
using Microsoft.AspNetCore.Mvc;

namespace KeyChain.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly KeychainDbContext _context;
        public HomeController(ILogger<HomeController> logger, KeychainDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult HomePage()
        {
            var randomAnswer = _context.RandomAnswers.OrderBy(x => Guid.NewGuid()).Select(r =>r.Answer).FirstOrDefault();
            if (randomAnswer != null)
            {
                Console.WriteLine($"DEBUG: {randomAnswer}"); // Kiểm tra chuỗi trong Console
                _logger.LogInformation("Answer from DB: " + randomAnswer); // Ghi log để kiểm tra
            }
            ViewBag.Answer = randomAnswer ?? "Cạn lời rùi!";
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
