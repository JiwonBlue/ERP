package erp.backend.domain.message.controller;

import erp.backend.domain.message.dto.MessageRequest;
import erp.backend.domain.message.service.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/message")
public class MessageController {
    private final MessageService messageService;

    @PostMapping
    public ResponseEntity<Long> messageRequest(@RequestBody MessageRequest request) {
        return ResponseEntity.ok(messageService.messageRequest(request));
    }
}
