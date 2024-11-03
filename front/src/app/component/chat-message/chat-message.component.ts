import {Component, Input} from '@angular/core';
import {ChatMessage} from '../../model/chatMessage';

@Component({
  selector: 'app-chat-message',
  templateUrl: './chat-message.component.html',
  styleUrl: './chat-message.component.css'
})
export class ChatMessageComponent {
  @Input() chatMessage!: ChatMessage;
}
