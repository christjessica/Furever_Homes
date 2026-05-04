using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Furever_Homes.Migrations
{
    /// <inheritdoc />
    public partial class FixAnimalPhotoRelationship : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AnimalPhoto_Animal",
                table: "AnimalPhoto");

            migrationBuilder.AlterColumn<string>(
                name: "PhotoUrl",
                table: "AnimalPhoto",
                type: "varchar(1000)",
                unicode: false,
                maxLength: 1000,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(255)",
                oldUnicode: false,
                oldMaxLength: 255);

            migrationBuilder.AddForeignKey(
                name: "FK_AnimalPhoto_Animal",
                table: "AnimalPhoto",
                column: "AnimalID",
                principalTable: "Animal",
                principalColumn: "AnimalID",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AnimalPhoto_Animal",
                table: "AnimalPhoto");

            migrationBuilder.AlterColumn<string>(
                name: "PhotoUrl",
                table: "AnimalPhoto",
                type: "varchar(255)",
                unicode: false,
                maxLength: 255,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(1000)",
                oldUnicode: false,
                oldMaxLength: 1000);

            migrationBuilder.AddForeignKey(
                name: "FK_AnimalPhoto_Animal",
                table: "AnimalPhoto",
                column: "AnimalID",
                principalTable: "Animal",
                principalColumn: "AnimalID");
        }
    }
}
