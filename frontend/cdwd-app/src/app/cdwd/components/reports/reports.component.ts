import {COMMA, ENTER, M} from '@angular/cdk/keycodes';
import {MatChipInputEvent} from '@angular/material/chips';
import { AfterViewChecked, ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute, ResolveEnd, ResolveStart, Router } from '@angular/router';

import { operators } from '../table-filter/table-filter-operators';
import { TableDataService } from '../table-data/table-data.service';
import { filter, mapTo, merge, Observable } from 'rxjs';
import { FormBuilder, FormControl, FormArray, FormGroup } from '@angular/forms';
import { filterFields, FilterFieldsTypes } from '../table-filter/table-filter-fields';

export interface ColumnFilterValue {
  name: string;
}

export interface AllFilters {
  column: string,
  operator: string,
  values: ColumnFilterValue[]
}

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.css']
})
export class ReportsComponent implements OnInit, AfterViewChecked {
  filterFields: any;
  table!: string;
  columns: string[] = [];

  idx = 0;
  tables: string[] = ['facilities', 'ansi_areas', 'geographic_areas', 'lcr_samples', 'pn_violations_assoc', 'pws', 'service_areas', 'site_visit', 'violation'];
  myForm!: FormGroup;

  aggregate_function_display_values: any = {
    'sum':'sum',
    'count': 'count',
    'avg': 'average'
  }

  addOnBlur = true;
  readonly separatorKeysCodes = [ENTER, COMMA] as const;
  columnFilterValues: ColumnFilterValue[] = [];
  allfilters: AllFilters[] = [];

  valuesArray: FormArray[] = [];

  isLoading$!: Observable<boolean>;
  private _showLoaderEvents$!: Observable<boolean>;
  private _hideLoaderEvents$!: Observable<boolean>;

  // output
  fromTables:string[] = [];
  whereQuery: string = '';
  groupByQuery: string = '';
  selectQuery: string = '';

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private tableDataService: TableDataService,
    private fb: FormBuilder,
    private readonly changeDetectorRef: ChangeDetectorRef
  ) {}

  ngAfterViewChecked(): void {
    this.changeDetectorRef.detectChanges();
  }

   getArrayFields(fields: Object){
     return Object.keys(fields)
   }

  ngOnInit(): void {
    this.myForm = this.fb.group({
      from: new FormControl(),
      filters: this.fb.array([]),
      group: this.fb.array([]),
      show: this.fb.array([])
    });

    const f = this.fb.group({
      column: [],
      operator: [],
      values: this.fb.array([])
    });

    this.filterForms.push(f);

    const fg = this.filterForms.at(this.filterForms.length-1) as FormGroup;
    this.valuesArray.push(fg.controls['values'] as FormArray)

    this.addGroupBy();
    this.addShowColumns();

    this._showLoaderEvents$ = this.router.events.pipe(
      filter((e) => e instanceof ResolveStart),
      mapTo(true)
    );
    this._hideLoaderEvents$ = this.router.events.pipe(
      filter((e) => e instanceof ResolveEnd),
      mapTo(false)
    );
    this.isLoading$ = merge(this._hideLoaderEvents$, this._showLoaderEvents$);
    this.fromForms.valueChanges.subscribe(
      value => {
        let allColumns: string[] = []
        value.forEach((table: string) => {
          allColumns.push(...Object.keys(filterFields[table]));
        })
        this.columns = allColumns.filter((v, i, a) => a.indexOf(v) === i)
        // this.columns.push(filterFields[]
      }
    );
  }

  get fromForms() {
    return this.myForm.get('from') as FormControl
  }

  get filterForms() {
    return this.myForm.get('filters') as FormArray
  }

  get groupForms() {
    return this.myForm.get('group') as FormArray
  }

  get showForms() {
    return this.myForm.get('show') as FormArray
  }

  get aggregateForm() {
    return this.groupForms.get('aggregate_fn') as FormControl
  }

  getNumberOfValuesEnterd(i: number) {
    const fg = this.filterForms.at(i) as FormGroup;
    return fg.controls['values'].value.length;
  }

  getSelectedOperator(i: number) {
    const fg = this.filterForms.at(i) as FormGroup;
    return fg.controls['operator'].value;
  }


  allFieldsEntered(): boolean {
    return this.isFieldHasValue(this.idx, 'column') && this.isFieldHasValue(this.idx, 'operator') && this.isFieldHasValue(this.idx, 'values')
  }

  addFilter(): void {

    const f = this.fb.group({
      column: [],
      operator: [],
      values: this.fb.array([])
    });

    this.filterForms.push(f);
    const fg = this.filterForms.at(this.filterForms.length-1) as FormGroup;
    this.valuesArray.push(fg.controls['values'] as FormArray)
    this.idx += 1;

  }

  deleteFilter(i: number): void {
    this.filterForms.removeAt(i);
  }

  addGroupBy(): void {
    this.groupForms.push(
      this.fb.group({
        grouping_col: ['']
      })
    );
  }

  allPrevGroupingSelected(): boolean {
    return this.groupForms.at(this.groupForms.length-1).value['grouping_col']
  }

  isAlreadySelectedGroupingColumn(column: string): boolean {
    let flag = false;
    this.groupForms.value.forEach((value:any) => {
      if (value['grouping_col'] == column){
        flag = true
      }
    })
    return flag;
  }


  addShowColumns(): void {
    this.showForms.push(this.fb.group({
      aggregate_fn: new FormControl(),
      showColumn: new FormControl()
    }));
  }

  allPrevShowColumnsSelected(): boolean {
    return this.showForms.at(this.showForms.length-1).value['aggregate_fn'] && this.showForms.at(this.showForms.length-1).value['showColumn']
  }

  isAlreadySelectedShowColumn(column: string): boolean {
    let flag = false;
    this.showForms.value.forEach((value:any) => {
      if (value['showColumn'] == column){
        flag = true
      }
    })
    return flag;
  }



  isAlreadySelectedColumn(i: number, column: string): boolean {
    for (let idx = 0; idx < i; idx++) {
      const fg = this.filterForms.at(idx) as FormGroup;
      const selectedColumn = fg.controls['column'].value

      if(selectedColumn.toLowerCase() === column.toLowerCase()){
        return true;
      }
    }
    return false;
  }

  add(i: number, event: MatChipInputEvent): void {
    const value = (event.value || '').trim();

    // Add our fruit
    if (value) {
      this.valuesArray[i].value.push({name: value});
    }

    // Clear the input value
    event.chipInput!.clear();
  }

  remove(i: number, f: ColumnFilterValue): void {
    const index = this.valuesArray[i].value.indexOf(f);

    if (index >= 0) {
      this.valuesArray[i].value.splice(index, 1);
    }
  }

  getOperators(i: number): string[] {
    const fg = this.filterForms.at(i) as FormGroup;
    const selectedColumn = fg.controls['column'].value;
    return operators[FilterFieldsTypes[selectedColumn.toLowerCase()]];
    //return operators[filterFields[this.table][selectedColumn.toLowerCase()]];
  }

  isColumnSelected(i: number): boolean {
    return this.isFieldHasValue(i, 'column');
  }


  isFieldHasValue(i: number, field: string): boolean {
    const fg = this.filterForms.at(i) as FormGroup;
    if(field === 'values') {
      return Boolean(fg.controls[field].value.length);
    }
    return Boolean(fg.controls[field].value);
  }

  filterHandler(): void {
    console.log(this.writeQuery());
    this.router.routeReuseStrategy.shouldReuseRoute = function () {
      return false;
    }
    this.router.onSameUrlNavigation = 'reload';
    this.tableDataService.setReportFilter({filter: this.writeQuery()}); // Setting filter if any
    this.tableDataService.setIsDownload(false);
    this.router.navigate([ `/report-table`]);
  }

  getColumnWithTableAlias(column: string): string {
    let table_alias = '';
    this.fromTables.forEach((table, idx) => {
      if(Object.keys(filterFields[table]).includes(column)) {
        table_alias = `t${idx+1}`;
      }
    })
    return `${table_alias}.${column}`;
  }

  writeQuery(): {} {
    this.fromTables = [];
    let from = '';
    let firstDone = false;

    if(this.fromForms.value) {
      this.fromForms.value.forEach((table: string, idx: number) => {
        this.fromTables.push(table);

        if(!firstDone) {
          from += `${table} t${idx+1}`
          firstDone = true;
        }
        else {
          from += ` JOIN ${table} t${idx+1} ON t${idx}.pwsid = t${idx+1}.pwsid`;
        }
      })

    }

    // where query
    this.whereQuery = '';
    firstDone = false;
    const data = this.myForm.value.filters;
    data.forEach((f: any) => {
      if(f.column && f.operator && f.values.length > 0) {
        if(firstDone) {
          this.whereQuery += ' AND ';
        }
        this.whereQuery += `${this.getColumnWithTableAlias(f.column.toLowerCase())} ${f.operator}`;

        firstDone = true;
        if (f.values.length > 0){
          if(!['<', '<=', '>', '>=', '=', 'starts with', 'ends with', 'contains'].includes(f.operator)) {
            this.whereQuery += ' (';
          }

          let first = true;
          f.values.forEach((v: any) => {
            if(!first) {
              this.whereQuery += ', ';
            }
            let quote = '';

            if(FilterFieldsTypes[f.column.toLowerCase()] === 'string') {
              quote = '"';
            }
            this.whereQuery += `${quote}${v['name']}${quote}`;

            first = false;
          })
          if(!['<', '<=', '>', '>=', '=', 'starts with', 'ends with', 'contains'].includes(f.operator)) {
            this.whereQuery += ') ';
          }
        }
      }
    });

    // groupby query
    this.groupByQuery = '';
    this.selectQuery = '';

    if(this.groupForms.value.at(0)['grouping_col']) {
      firstDone = false;
      this.groupForms.value.forEach((value:any) => {
        if (firstDone) {
          this.groupByQuery += `, `;
        }
        this.groupByQuery += `${this.getColumnWithTableAlias(value['grouping_col'].toLowerCase())}`;

        firstDone = true;
      })

      // select query
      this.selectQuery = this.groupByQuery;
      this.showForms.value.forEach((value:any) => {
        if(value['aggregate_fn'] && value['showColumn']) {
          this.selectQuery += `,`;
          this.selectQuery += ` ${value['aggregate_fn']}(${this.getColumnWithTableAlias(value['showColumn'].toLowerCase())})`;
        }

      })
    }
    return {
      'from': from,
      'where': this.whereQuery,
      'groupby': this.groupByQuery,
      'select': this.selectQuery
    }
  }

  showFilter(): string {

    // from query
    let from = '';
    let firstDone = false;
    if(this.fromForms.value) {
      this.fromForms.value.forEach((table: string) => {
        if(firstDone) {
          from += ','
        }
        from += ` ${table}`;
        firstDone = true;
      })
    }

    // where query
    let where = '';
    firstDone = false;
    const data = this.myForm.value.filters;
    data.forEach((f: any) => {
      if(f.column && f.operator && f.values.length > 0) {
        if(firstDone) {
          where += ' AND ';
        }
        where += `${f.column.toLowerCase()} ${f.operator}`;

        firstDone = true;
        if (f.values.length > 0){
          if(!['<', '<=', '>', '>=', '=', 'starts with', 'ends with', 'contains'].includes(f.operator)) {
            where += ' (';
          }

          let first = true;
          f.values.forEach((v: any) => {
            if(!first) {
              where += ', ';
            }
            let quote = '';

            if(FilterFieldsTypes[f.column.toLowerCase()] === 'string') {
              quote = '"';
            }
            where += `${quote}${v['name']}${quote}`;

            first = false;
          })
          if(!['<', '<=', '>', '>=', '=', 'starts with', 'ends with', 'contains'].includes(f.operator)) {
            where += ') ';
          }
        }
      }
    });

    // groupby query
    let groupby = '';
    let showCol = '';


    if(this.groupForms.value.at(0)['grouping_col']) {
      firstDone = false;
      this.groupForms.value.forEach((value:any) => {
        if (firstDone) {
          groupby += `,`;
        }
        groupby += ` ${value['grouping_col']}`
        firstDone = true;
      })

      // select query
      showCol = groupby;
      this.showForms.value.forEach((value:any) => {
        if(value['aggregate_fn'] && value['showColumn']) {
          showCol += `,`;
          showCol += ` ${value['aggregate_fn']}(${value['showColumn']})`;
        }

      })
    }


    let filters = '';
    if (from) {
      filters += `from ${from}`;
      if (where) {
        filters += `\n\t filter ${where}`;
      }
      if (groupby) {
        filters += `\n\t group by ${groupby}`;
      }
      if (showCol) {
        filters += `\n\t display ${showCol}`;
      }
      return filters;
    }
    else {
      return 'None';
    }
  }

}
