using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LangSequenceTraining.Migrations
{
    /// <inheritdoc />
    public partial class m10 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "LastSuccess",
                table: "UserSequenceProgress",
                type: "boolean",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastSuccess",
                table: "UserSequenceProgress");
        }
    }
}
