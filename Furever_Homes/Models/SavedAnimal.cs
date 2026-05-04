using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class SavedAnimal
{
    public int SavedAnimalId { get; set; }

    public int AdopterId { get; set; }
    public int AnimalId { get; set; }

    public virtual Adopter Adopter { get; set; } = null!;
    public virtual Animal Animal { get; set; } = null!;
}
