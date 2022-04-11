import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { delay, map, Observable } from 'rxjs';
import { TableDataService } from '../table-data/table-data.service';
import { TableModel } from './table.model';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent implements OnInit {

  table$!: Observable<TableModel>;
  isLoading = false;
  table!: string;
  filter = '';

  start = 0;
  pageIndex = 0;
  rowsPerPage = 10;
  pageSizeOptions = [5, 10, 25, 50, 100];

  dataSource!: MatTableDataSource<any>;

  constructor(
    private activatedRoute: ActivatedRoute,
    private tableDataService: TableDataService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.table$ = this.activatedRoute.data.pipe(map((data) => data?.['table']));
    this.table$.subscribe(this.writeTable);

  }

  writeTable = (table: TableModel) => {
    console.log('Table component writeTable function')
    this.table = table.table;
    this.dataSource = new MatTableDataSource(Object.values(table.tableData).slice(this.start, this.start + this.rowsPerPage));
    this.filter = table.filter;
    this.isLoading = false;
  }

  onPageChanged(pageEvent: PageEvent, tableData: {}): void {
    console.log(pageEvent);
    this.isLoading = true;
    console.log(this.isLoading);
    this.pageIndex = pageEvent.pageIndex;
    this.rowsPerPage = pageEvent.pageSize;
    this.start = this.pageIndex * this.rowsPerPage;

    console.log(this.pageIndex)
    console.log(this.rowsPerPage)
    console.log(this.start)
    console.log(Object.values(tableData).slice(this.start, this.start + this.rowsPerPage))

    // this.tableDataService.filterTableData(this.table, this.start, this.rowsPerPage, this.filter)
    //   .subscribe(this.writeTable);

    this.dataSource = new MatTableDataSource(Object.values(tableData).slice(this.start, this.start + this.rowsPerPage));

    this.isLoading = false;
  }
  filterTable(): void {
    this.router.routeReuseStrategy.shouldReuseRoute = function () {
      return false;
    }
    this.router.onSameUrlNavigation = 'reload';
    this.router.navigate([`/table-filter/${this.table}`]);
  }

}
