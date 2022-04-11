import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { TableDataService } from './table-data.service';
import { MatTableDataSource } from "@angular/material/table";
import { PageEvent } from "@angular/material/paginator";
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { TableModel } from '../table/table.model';

@Component({
  selector: 'app-table-data',
  templateUrl: './table-data.component.html',
  styleUrls: ['./table-data.component.css']
})
export class TableDataComponent implements OnInit, OnDestroy {

  constructor(private router: Router, private tableDataService: TableDataService) {}

  @Input() table: string = '';
  private tableFilterSub!: Subscription;
  tableData: any;
  dataSource: any;
  columns: string[] = [];
  isLoading = true;
  totalRows: number = 0;
  column_values: {} = {};
  rowsPerPage = 10;
  pageIndex = 0;
  first = 0;
  isDmlApplicable = false;
  pageSizeOptions = [5, 10, 15, 20, 25, 30];
  filter_values = null;

  ngOnInit(): void {
    this.tableFilterSub = this.tableDataService.getClickCall()
      .subscribe(filter_values => {
        this.isLoading = true;
        this.filter_values = filter_values;
        console.log(this.filter_values);
        this.getTableData();
      });

    if (this.table) {
      console.log('It has table name ' + this.table);
      this.getTableData();
    } else {
      this.router.navigate(['/']);
    }
  }

  ngOnDestroy(): void {
    this.tableFilterSub.unsubscribe();
  }

  updateTableData = (responseData: TableModel) => {
    this.tableData = responseData.tableData;
    this.columns = responseData.columns;
    this.totalRows = responseData.totalRows;
    this.dataSource = new MatTableDataSource(Object.values(this.tableData));
    this.isLoading = false;
  }

  getTableData(): void {
    if(this.filter_values) {
      this.rowsPerPage = 10;
      this.pageIndex = 0;
      this.first = 0;
      this.tableDataService.filterTableData(this.table, this.first, this.rowsPerPage, {data: this.filter_values})
      .subscribe(this.updateTableData);
    } else {
      this.tableDataService.getTableData(this.table, this.first, this.rowsPerPage)
        .subscribe(this.updateTableData);
    }

  }

  onPageChanged(pageData: PageEvent): void {
    this.isLoading = true;
    this.pageIndex = pageData.pageIndex;

    if(this.rowsPerPage == pageData.pageSize) {
      this.first = this.pageIndex * this.rowsPerPage
    }

    this.rowsPerPage = pageData.pageSize;

    console.log(this.pageIndex)
    console.log(this.rowsPerPage)
    console.log(this.first)
    this.getTableData();
  }

}
