﻿namespace LangSequenceTraining.Model.Base
{
    internal class UserState
    {
        public Guid Id { get; set; }

        public Guid UserId { get; set; }

        public User User { get; set; }

        public string State { get; set; }
    }
}
