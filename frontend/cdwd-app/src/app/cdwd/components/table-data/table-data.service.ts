import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, Subject } from "rxjs";
import { TableModel } from "../table/table.model";

@Injectable({
  providedIn: 'root'
})
export class TableDataService {

  subject = new Subject<any>();
  filter!: {};

  constructor(private http: HttpClient) {}

  sendClickCall(filterValues: Object) {
    console.log(filterValues);
    this.subject.next(filterValues);
  }

  setFilter(filter:{}): void {
    this.filter = filter;
  }

  getClickCall(): Observable<any> {
    return this.subject.asObservable();
  }


  getTableData(table: string, startIndex: number, limit: number): Observable<TableModel> {
    return this.http.get<TableModel>(`http://localhost:3000/api/${table}/pagination?start=${startIndex}&limit=${limit}`);
  }

  filterTableData(table: string, startIndex: number, limit: number, filter_values: {}): Observable<TableModel> {
    console.log(filter_values)
    return this.http.post<TableModel>(`http://localhost:3000/api/${table}/pagination?start=${startIndex}&limit=${limit}`, filter_values);
  }
}
