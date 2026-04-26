using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class Breed
{
    public int BreedId { get; set; }

    public string BreedName { get; set; } = null!;

    public int AnimalTypeId { get; set; }

    public virtual AnimalType AnimalType { get; set; } = null!;

    public virtual ICollection<Animal> Animals { get; set; } = new List<Animal>();
}
