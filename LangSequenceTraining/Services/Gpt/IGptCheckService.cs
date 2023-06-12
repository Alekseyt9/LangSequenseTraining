
using LangSequenceTraining.Services.Gpt;

namespace LangSequenceTraining.Services
{
    internal interface IGptCheckService
    {
        Task<CheckResult> Check(string msg);
    }
}
