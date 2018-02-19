import { Component } from '@angular/core';
import { AppService } from './app.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  campoFiltro: string = '';

  ramais = [];
  disponiveis = [];
  ligacao = [];
  indisponiveis = [];
  filtro = [];

  constructor( private service: AppService ){

    setInterval(() => {
      this.service.getRamais().subscribe((response: [any])=> {
        this.disponiveis = [];
        this.ligacao = [];
        this.indisponiveis = [];

        this.ramais = response.filter(i => this.filtro.includes(i.ramal+''));
        this.ramais.forEach(r => {
          if(r.status === 1){
            this.disponiveis.push(r)
          }else if(r.status === 2){
            this.indisponiveis.push(r)
          }else if(r.status === 3){
            this.ligacao.push(r)
          }
        })
      })
    }, 1000)
  }

  onChangeFiltro(ramais){
    console.log({method: 'changeFiltro', ramais});
    this.filtro = ramais.target.value.split(',');
  }

}
