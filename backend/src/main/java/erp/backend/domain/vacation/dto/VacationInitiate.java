package erp.backend.domain.vacation.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VacationInitiate {
    private Long empId;
    private int vacationTotalVacation;
    private int vacationUsedVacation;
    private int vacationTotalDayOff;
    private int vacationUsedDayOff;
}