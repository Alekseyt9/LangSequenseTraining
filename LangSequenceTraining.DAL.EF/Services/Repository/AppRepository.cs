﻿
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore.Internal;

namespace LangSequenceTraining.DAL.Services
{
    public class AppRepository : IAppRepository
    {
        private AppDbContext _ctx;

        public AppRepository(AppDbContext ctx)
        {
            _ctx = ctx;
        }

        public User GetUser(string userName)
        {
            var user = _ctx.Users.FirstOrDefault(x => x.Name == userName);
            if (user == null)
            {
                user = new User()
                {
                    Id = Guid.NewGuid(),
                    Name = userName,
                };
                _ctx.Users.Add(user);
                _ctx.SaveChanges();
            }

            return user;
        }

        public User GetUser(Guid id)
        {
            return _ctx.Users.FirstOrDefault(x => x.Id == id);
        }

        public IEnumerable<SequenceGroup> GetGroups()
        {
            return _ctx.SequenceGroup.OrderBy(x => x.Name).ToList();
        }

        public IEnumerable<Sequence> GetSequences(string groupName)
        {
            var gr = _ctx.SequenceGroup.First(x => x.Name == groupName);
            return _ctx.Sequences.Where(x => x.SequenceGroupId == gr.Id).ToList();
        }

        public IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId)
        {
            throw new NotImplementedException();
            /*
            _ctx.Sequences.Where(x => x.SequenceGroupId == groupId)
                .LeftJoin(_ctx.UserSequenceProgress, s => s.Id, p => p.SequenceId)
                .Select(x => )
                .Where(x => x.)
            */
        }

        public IEnumerable<UserSequenceProgress> GetProgressData(Guid userId)
        {
            return _ctx.UserSequenceProgress.Where(x => x.UserId == userId /*&& x.Sequence.SequenceGroupId == groupId*/).ToList();
        }

        public UserState GetUserState(Guid userId)
        {
            return _ctx.UserState.FirstOrDefault(x => x.UserId == userId);
        }

        public void SetUserState(Guid userId, UserState state)
        {
            if (state.Id == Guid.Empty)
            {
                _ctx.UserState.Add(state);
            }
            else
            {
                _ctx.UserState.Update(state);
            }
            
            _ctx.SaveChanges();
        }

    }
}