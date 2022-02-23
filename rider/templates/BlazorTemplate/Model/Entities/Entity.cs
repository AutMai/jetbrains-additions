using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Model.Entities;


[Table("ENTITIES")]
public class Entity {
    [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Column("ENTITY_ID")]
    public int Id { get; set; }
    
    [Required, StringLength(100)]
    [Column("NAME", TypeName = "VARCHAR(100)")]
    public string Name { get; set; }

    [Required, Range(0,100)]
    [Column("NUMBER")]
    public int Number { get; set; }
}