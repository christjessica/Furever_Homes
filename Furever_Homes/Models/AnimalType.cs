using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class AnimalType
{
    public int AnimalTypeId { get; set; }

    public string TypeName { get; set; } = null!;

    public virtual ICollection<Animal> Animals { get; set; } = new List<Animal>();

    public virtual ICollection<Breed> Breeds { get; set; } = new List<Breed>();
}
