import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, Subject } from "rxjs";
import { TableModel } from "../table/table.model";

@Injectable({
  providedIn: 'root'
})
export class TableDataService {

  subject = new Subject<any>();
  filter!: {};
  report_filter !: {};

  constructor(private http: HttpClient) {}

  sendClickCall(filterValues: Object) {
    console.log(filterValues);
    this.subject.next(filterValues);
  }

  setFilter(filter:{}): void {
    this.filter = filter;
  }

  setReportFilter(report_filter:{}): void {
    this.report_filter = report_filter;
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

  reportTableData(startIndex: number, limit: number, report_filter_values: {}): Observable<TableModel> {
    console.log(report_filter_values);
    return this.http.post<TableModel>(`http://localhost:3000/api/report/pagination?start=${startIndex}&limit=${limit}`, report_filter_values);
  }

  downloadData(): Observable<any> {
    let HTTPOptions:Object = {

      headers: new HttpHeaders({
          'Content-Type': 'application/json'
      }),
      responseType: 'text'
   }
    return this.http.post<any>(`http://localhost:3000/api/report/download`, this.report_filter, HTTPOptions);
  }

}
