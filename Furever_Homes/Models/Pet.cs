using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class Pet
{
    public string PetId { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Species { get; set; } = null!;

    public string Breed { get; set; } = null!;

    public int Age { get; set; }

    public string NeuterStatus { get; set; } = null!;

    public string? EnergyLevel { get; set; }

    public string? GoodWithKids { get; set; }

    public string? GoodWithPets { get; set; }

    public string AdoptionStatus { get; set; } = null!;

    public string ShelterId { get; set; } = null!;

    public byte[]? Image { get; set; }

    public virtual Shelters2 Shelter { get; set; } = null!;
}
