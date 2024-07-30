using System.ComponentModel.DataAnnotations;

namespace ShoppingWebApp.Models
{
    public class RegisterDTO
    {
        [Required]
        public string Email { get; set; } = null!;
        [Required]
        public string Password { get; set; } = null!;
    }
}
