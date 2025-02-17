using System.Text;

namespace KeyChain.Helper
{
    public static class MyEncryptionHelper
    {
        public static string Decrypt(string encryptedText)
        {
            var base64EncodedBytes = Convert.FromBase64String(encryptedText);
            return Encoding.UTF8.GetString(base64EncodedBytes);
        }

        public static string Encrypt(string plainText)
        {
            var plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(plainTextBytes);
        }
    }

}
