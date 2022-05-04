import { Component, OnInit } from '@angular/core';
import { ResolveEnd, ResolveStart, Router } from '@angular/router';
import { filter, mapTo, merge, Observable } from 'rxjs';
import { TableDataService } from '../table-data/table-data.service';
import { tablesMetaData } from './tables-meta-data';

@Component({
  selector: 'app-tables',
  templateUrl: './tables.component.html',
  styleUrls: ['./tables.component.css']
})
export class TablesComponent implements OnInit {

  tables = tablesMetaData;
  isLoading$!: Observable<boolean>;
  private _showLoaderEvents$!: Observable<boolean>;
  private _hideLoaderEvents$!: Observable<boolean>;

  constructor(private router: Router, private tableDataService: TableDataService) {}

  ngOnInit(): void {
    this._showLoaderEvents$ = this.router.events.pipe(
      filter((e) => e instanceof ResolveStart),
      mapTo(true)
    );
    this._hideLoaderEvents$ = this.router.events.pipe(
      filter((e) => e instanceof ResolveEnd),
      mapTo(false)
    );
    this.isLoading$ = merge(this._hideLoaderEvents$, this._showLoaderEvents$);
  }

  showTableData(table: string): void {
    console.log(table)
    this.router.routeReuseStrategy.shouldReuseRoute = function () {
      return false;
    }
    this.router.onSameUrlNavigation = 'reload';
    this.tableDataService.setFilter({filter: ''}); // Removing filter if any
    this.router.navigate([ `/table/${table}`]);
  }

  filterTableData(table: string): void {
    console.log(table)
    this.router.routeReuseStrategy.shouldReuseRoute = function () {
      return false;
    }
    this.router.onSameUrlNavigation = 'reload';
    this.router.navigate([`/table-filter/${table}`]);
  }
}
