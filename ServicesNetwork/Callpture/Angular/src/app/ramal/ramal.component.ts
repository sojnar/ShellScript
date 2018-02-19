import { Input, Component, OnInit } from '@angular/core';

@Component({
  selector: 'ramal',
  templateUrl: './ramal.component.html',
  styleUrls: ['./ramal.component.css']
})
export class RamalComponent implements OnInit {

  @Input() nome: string;
  @Input() ramal: string | number;
  @Input() status: string | number;

  constructor() { }

  ngOnInit() {
  }

  getStatus(){
    if(this.status === 1){
      return 'Disponivel'
    }
    if(this.status === 2){
      return 'Indisponivel'
    }
    if(this.status === 3){
      return 'Em Ligacao'
    }
  }

}
