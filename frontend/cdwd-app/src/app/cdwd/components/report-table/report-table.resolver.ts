import { Injectable } from '@angular/core';
import {
  Router,
  Resolve,
  ActivatedRouteSnapshot
} from '@angular/router';
import { catchError, delay, EMPTY, Observable, of } from 'rxjs';
import { TableDataService } from '../table-data/table-data.service';

@Injectable({
  providedIn: 'root'
})
export class ReportTableResolver implements Resolve<{}> {

  constructor(private router: Router, private tableDataService: TableDataService) {}

  resolve(): Observable<{}> {
    console.log('IN report table resolver')
    console.log(this.tableDataService.report_filter);
    return this.tableDataService.reportTableData(0, 10, this.tableDataService.report_filter).pipe(
      delay(500),
      catchError(() => {
        this.router.navigate([""]);
        return EMPTY;
      })
    );
  }
}
