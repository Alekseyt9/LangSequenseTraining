﻿
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.DAL.Services
{
    public class AppRepository : IAppRepository
    {
        private readonly AppDbContext _ctx;

        public AppRepository(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        public IEnumerable<SequenceGroup> GetGroups()
        {
            return _ctx.SequenceGroup.Where(x => !x.IsHide).OrderBy(x => x.Order).ToList();
        }

        public IEnumerable<Sequence> GetSequences()
        {
            return _ctx.Sequences;
        }

        public void SaveUserProgress(IEnumerable<UserSequenceProgress> prs)
        {
            foreach (var pr in prs)
            {
                if (pr.Id == Guid.Empty)
                {
                    pr.Id = Guid.NewGuid();
                    pr.SequenceId = pr.Sequence.Id;
                    pr.Sequence = null;
                    _ctx.UserSequenceProgress.Add(pr);
                }
                else
                {
                    _ctx.UserSequenceProgress.Update(pr);
                }
            }
            _ctx.SaveChanges();
        }

        public IEnumerable<UserSequenceProgress> GetExistedProgress(Guid userId, IEnumerable<Guid> idsList)
        {
            var idsHs = new HashSet<Guid>(idsList);
            return _ctx.UserSequenceProgress.Where(x => x.UserId == userId && idsHs.Contains(x.Sequence.Id)).ToList();
        }

    }
}
