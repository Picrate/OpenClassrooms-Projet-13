/*
  ChatMessage  model
 */
export interface ChatMessage {
  content: string,
  sender: string | null,
  messageType: string
}
