using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LangSequenceTraining.Migrations
{
    /// <inheritdoc />
    public partial class m11 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastSuccessTime",
                table: "UserSequenceProgress");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "LastSuccessTime",
                table: "UserSequenceProgress",
                type: "timestamp with time zone",
                nullable: true);
        }
    }
}
