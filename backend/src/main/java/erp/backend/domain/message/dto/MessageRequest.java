package erp.backend.domain.message.dto;

import erp.backend.domain.emp.entity.Emp;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageRequest {

    private String messageContent = "test";
    private Emp messageReceiverEmpId;
    private Emp messageSenderEmpId;
    private String messageStatus;
    private String messageSubject;

}
