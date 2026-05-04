using Furever_Homes.Models;

namespace Furever_Homes.Services
{
    public class UserFilter
    {
        public AnimalType UserPet { get; set; } = new AnimalType { TypeName = string.Empty };
        public string UserSex { get; set; }
        //Max/min ages for filtering, -1 means no filter
        public int MinAge { get; set; } = -1; 
        public int MaxAge { get; set; } = -1;
    }
}
