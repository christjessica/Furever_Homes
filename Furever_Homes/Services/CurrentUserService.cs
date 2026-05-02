using Furever_Homes.Models;

namespace Furever_Homes.Services
{
    public class CurrentUserService
    {
        public ApplicationUser? User { get; set; }
        public bool IsAuthenticated => User != null;
        public string? UserType => User?.UserType;
        public string? UserId => User?.Id;
    }
}
