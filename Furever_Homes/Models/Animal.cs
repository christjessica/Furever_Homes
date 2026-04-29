using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class Animal
{
    public int AnimalId { get; set; }

    public string Name { get; set; } = null!;

    public int AnimalTypeId { get; set; }

    public int BreedId { get; set; }

    public int? Age { get; set; }

    public decimal? Weight { get; set; }

    public string? Sex { get; set; }

    public string? Color { get; set; }

    public bool? SpayedNeutered { get; set; }

    public string? Notes { get; set; }

    public bool Available { get; set; }

    public int ShelterId { get; set; }

    public bool Vaccinated { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<AdoptionApplication> AdoptionApplications { get; set; } = new List<AdoptionApplication>();

    public virtual AnimalPhoto? AnimalPhoto { get; set; }

    public virtual AnimalType AnimalType { get; set; } = null!;

    public virtual Breed? Breed { get; set; }

    public virtual CatDetail? CatDetail { get; set; }

    public virtual DogDetail? DogDetail { get; set; }

    public virtual Shelter Shelter { get; set; } = null!;
}
