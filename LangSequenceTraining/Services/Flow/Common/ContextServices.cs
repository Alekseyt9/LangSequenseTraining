

namespace LangSequenceTraining.Services
{
    internal class ContextServices
    {
        private readonly IGptCheckService _gptCheckService;
        private readonly ITelegramBot _telegramBot;
        private readonly IAppRepository _repository;
        private readonly IProcessorManager _processorManager;
        private readonly ITextToSpeech _textToSpeech;
        private readonly ILearningService _learningService;
        private readonly ISequenceProvider _sequenceProvider;

        public ISequenceProvider SequenceProvider => _sequenceProvider;

        public IGptCheckService GptCheckService => _gptCheckService;

        public IAppRepository Repository => _repository;

        public ITelegramBot TelegramBot => _telegramBot;

        public IProcessorManager ProcessorManager => _processorManager;

        public ITextToSpeech TextToSpeech => _textToSpeech;

        public ILearningService LearningService  => _learningService;

        public ContextServices(
            IGptCheckService gptCheckService, ITelegramBot telegramBot, 
            IAppRepository repository, IProcessorManager processorManager, 
            ITextToSpeech textToSpeech, ILearningService learningService,
            ISequenceProvider sequenceProvider)
        {
            _gptCheckService = gptCheckService;
            _telegramBot = telegramBot;
            _repository = repository;
            _processorManager = processorManager;
            _textToSpeech = textToSpeech;
            _learningService = learningService;
            _sequenceProvider = sequenceProvider;
        }

    }
}
