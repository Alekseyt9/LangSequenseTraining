﻿
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface IAppRepository
    {
        User GetUser(string userName);

        User GetUser(Guid id);

        IEnumerable<SequenceGroup> GetGroups();

        IEnumerable<Sequence> GetSequences(string groupName);

        IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId);

        IEnumerable<UserSequenceProgress> GetProgressData(Guid userId);

        UserState GetUserState(Guid userId);

        void SetUserState(Guid userId, UserState state);

    }
}