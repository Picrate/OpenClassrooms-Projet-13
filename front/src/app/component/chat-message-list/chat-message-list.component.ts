import {Component, Input, OnInit} from '@angular/core';
import {ChatMessage} from '../../model/chatMessage';

@Component({
  selector: 'app-chat-message-list',
  templateUrl: './chat-message-list.component.html',
  styleUrl: './chat-message-list.component.css'
})
export class ChatMessageListComponent implements OnInit {

  @Input() chatMessages: ChatMessage[] | undefined;
  ngOnInit(): void {
  }
}
