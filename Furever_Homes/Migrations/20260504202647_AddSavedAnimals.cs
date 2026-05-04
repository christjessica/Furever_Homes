using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Furever_Homes.Migrations
{
    /// <inheritdoc />
    public partial class AddSavedAnimals : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SavedAnimal",
                columns: table => new
                {
                    SavedAnimalId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AdopterId = table.Column<int>(type: "int", nullable: false),
                    AnimalId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SavedAnimal", x => x.SavedAnimalId);
                    table.ForeignKey(
                        name: "FK_SavedAnimal_Adopter_AdopterId",
                        column: x => x.AdopterId,
                        principalTable: "Adopter",
                        principalColumn: "AdopterID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_SavedAnimal_Animal_AnimalId",
                        column: x => x.AnimalId,
                        principalTable: "Animal",
                        principalColumn: "AnimalID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_SavedAnimal_AdopterId",
                table: "SavedAnimal",
                column: "AdopterId");

            migrationBuilder.CreateIndex(
                name: "IX_SavedAnimal_AnimalId",
                table: "SavedAnimal",
                column: "AnimalId");

            migrationBuilder.CreateIndex(
                name: "UQ_SavedAnimal_Adopter_Animal",
                table: "SavedAnimal",
                columns: new[] { "AdopterId", "AnimalId" },
                unique: true);
            }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SavedAnimal");
        }
    }
}
