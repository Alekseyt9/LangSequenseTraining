

namespace LangSequenceTraining.Services
{
    internal class ContextServices
    {
        private IGptService _gptService;
        private ITelegramBot _telegramBot;
        private IAppRepository _repository;

        public IGptService GptService => _gptService;

        public IAppRepository Repository => _repository;

        public ITelegramBot TelegramBot => _telegramBot;

        public ContextServices(IGptService gptService, ITelegramBot telegramBot, IAppRepository repository)
        {
            _gptService = gptService;
            _telegramBot = telegramBot;
            _repository = repository;
        }



    }
}
