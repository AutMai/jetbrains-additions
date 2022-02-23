using System.Linq.Expressions;
using Model.Entities;

namespace Domain.Repositories; 

public interface IEntityRepository:IRepository<Entity> {
    public Task<List<Entity>> ReadGraphAsync(Expression<Func<Entity, bool>> filter);
}