using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class Shelters2
{
    public string ShelterId { get; set; } = null!;

    public string ShelterName { get; set; } = null!;

    public string? Email { get; set; }

    public string? Address { get; set; }

    public int? PetCount { get; set; }

    public virtual ICollection<Pet> Pets { get; set; } = new List<Pet>();
}
