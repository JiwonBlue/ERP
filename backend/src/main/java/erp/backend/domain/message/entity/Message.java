package erp.backend.domain.message.entity;

import erp.backend.domain.emp.entity.Emp;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MESSAGE_ID")
    private long messageId;

    @Column(name = "MESSAGE_CONTENT")
    private String messageContent;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn (name = "MESSAGE_RECEIVER_EMP_ID")
    private Emp messageReceiverEmpId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn (name = "MESSAGE_SENDER_EMP_ID")
    private Emp messageSenderEmpId;

    @Column(name = "MESSAGE_STATUS")
    private String messageStatus;

    @Column(name = "MESSAGE_SUBJECT")
    private String messageSubject;


}
