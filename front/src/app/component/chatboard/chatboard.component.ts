import {Component, OnDestroy, OnInit} from '@angular/core';
import {ChatService} from '../../service/chat.service';
import {Subscription} from 'rxjs';
import {Message} from '@stomp/stompjs';
import {ChatMessage} from '../../model/chatMessage';
import {FormControl, FormGroup} from '@angular/forms';

@Component({
  selector: 'app-chatboard',
  templateUrl: './chatboard.component.html',
  styleUrl: './chatboard.component.css'
})
export class ChatboardComponent implements OnInit, OnDestroy{

  receivedMessages: ChatMessage[] = [];
  // @ts-ignore, to suppress warning related to being undefined
  private topicSubscription: Subscription;

  sendForm: FormGroup = new FormGroup({
    messageToSend: new FormControl(''),
  });

  constructor(private chatService: ChatService) {
  }

  ngOnInit(): void {

    // Join as new chat user
    const joinMessage: ChatMessage = {
      sender: sessionStorage.getItem('username'),
      messageType: 'JOIN',
      content: ''
    }
    this.chatService.publish({
      destination: '/app/register',
      body:JSON.stringify(joinMessage)
    });

    // Subscribe to chat messages
    this.topicSubscription = this.chatService
      .watch('/topic/public')
      .subscribe((message: Message) => {
        const newMessage = JSON.parse(message.body) as ChatMessage
        this.receivedMessages.push(newMessage);
      });
  }

  ngOnDestroy(): void {
    this.topicSubscription.unsubscribe();
  }

  onSendMessage() {

    const messageToSend: ChatMessage = {
      sender: sessionStorage.getItem('username'),
      messageType: 'CHAT',
      content: this.sendForm.controls['messageToSend'].value
    }
    this.chatService.publish({
      destination: '/app/send',
      body:JSON.stringify(messageToSend)
    });
  }
}
