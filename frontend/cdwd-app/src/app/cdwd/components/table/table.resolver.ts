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
export class TableResolver implements Resolve<{}> {

  constructor(private router: Router, private tableDataService: TableDataService) {}

  resolve(route: ActivatedRouteSnapshot): Observable<{}> {

    console.log(this.tableDataService.filter);
    const table = route.params?.['table_name'];
    return this.tableDataService.filterTableData(table, 0, 10, this.tableDataService.filter).pipe(
      delay(500),
      catchError(() => {
        this.router.navigate([""]);
        return EMPTY;
      })
    );
  }
}
