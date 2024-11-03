import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {SigninComponent} from './component/signin/signin.component';
import {ChatboardComponent} from './component/chatboard/chatboard.component';

const routes: Routes = [
  {path: 'signin', component: SigninComponent  },
  {path: 'chat-board', component: ChatboardComponent  },
  { path: '',   redirectTo: '/signin', pathMatch: 'full' }, // redirect to `signin`
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
