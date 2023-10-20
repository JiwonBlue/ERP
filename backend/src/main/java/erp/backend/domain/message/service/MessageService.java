package erp.backend.domain.message.service;

import erp.backend.domain.emp.entity.Emp;
import erp.backend.domain.message.dto.MessageRequest;
import erp.backend.domain.message.entity.Message;
import erp.backend.domain.message.repository.MessageRepository;
import erp.backend.global.config.security.SecurityHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MessageService {
    private final MessageRepository messageRepository;

    @Transactional
    public Long messageRequest(MessageRequest request){
        Emp emp = SecurityHelper.getAccount();
        Message entity = Message.builder()
                .messageSenderEmpId(emp)
                .messageStatus(request.getMessageStatus())
                .messageContent(request.getMessageContent())
                .messageSubject(request.getMessageSubject())
                .build();
        messageRepository.save(entity);
        return entity.getMessageId();
    }
}
