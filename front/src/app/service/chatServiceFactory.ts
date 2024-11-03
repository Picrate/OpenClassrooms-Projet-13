import {ChatService} from './chat.service';
import {rxStompConfig} from '../rx-stomp.config';

export function ChatServiceFactory() {
  const rxStomp = new ChatService();
  rxStomp.configure(rxStompConfig);
  rxStomp.activate();
  return rxStomp;
}
