import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SigninComponent } from './component/signin/signin.component';
import { ChatboardComponent } from './component/chatboard/chatboard.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {ButtonDirective} from 'primeng/button';
import {InputTextModule} from 'primeng/inputtext';
import {ChatService} from './service/chat.service';
import {ChatServiceFactory} from './service/chatServiceFactory';
import {InputTextareaModule} from 'primeng/inputtextarea';
import { ChatMessageComponent } from './component/chat-message/chat-message.component';
import { ChatMessageListComponent } from './component/chat-message-list/chat-message-list.component';
import {CardModule} from 'primeng/card';

@NgModule({
  declarations: [
    AppComponent,
    SigninComponent,
    ChatboardComponent,
    ChatMessageComponent,
    ChatMessageListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    ButtonDirective,
    InputTextModule,
    FormsModule,
    InputTextareaModule,
    CardModule
  ],
  providers: [
    {provide: ChatService, useFactory: ChatServiceFactory,},
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
