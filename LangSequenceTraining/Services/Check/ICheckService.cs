
using LangSequenceTraining.Services.Gpt;

namespace LangSequenceTraining.Services
{
    public interface ICheckService
    {
        Task<CheckResult> Check(string msg, bool reset);
    }
}
