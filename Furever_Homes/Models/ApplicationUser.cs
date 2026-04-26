using Microsoft.AspNetCore.Identity;

namespace Furever_Homes.Models;

public class ApplicationUser : IdentityUser
{
    public string UserType { get; set; } = string.Empty;
}