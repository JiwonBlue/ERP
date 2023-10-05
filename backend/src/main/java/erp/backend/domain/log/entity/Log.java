package erp.backend.domain.log.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import erp.backend.domain.emp.entity.Emp;
import erp.backend.domain.log.dto.UpdateLog;
import jakarta.persistence.*;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

@Entity //jpa 사용할때!
@Getter
@Builder
@AllArgsConstructor // 파라미터있는생성자
@NoArgsConstructor // 기본생성자
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "LOG_ID")
    private long logId;
    //외래키
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LOG_EMP_ID")
    private Emp emp;

    @Column(name = "LOG_DATE")
    private LocalDate logDate;

    @Column(name = "LOG_CHECKIN")
    private LocalDateTime logCheckIn;

    @Column(name = "LOG_CHECKOUT")
    private LocalDateTime logCheckOut;

    @Column(name = "LOG_STATUS")
    private String logStatus;

    public void update(Emp emp, UpdateLog request){
        this.logCheckOut = LocalDateTime.now();
        this.logStatus = "퇴근";
    }
}
