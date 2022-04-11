import {COMMA, ENTER} from '@angular/cdk/keycodes';
import {MatChipInputEvent} from '@angular/material/chips';
import { AfterViewChecked, ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute, ResolveEnd, ResolveStart, Router } from '@angular/router';
import { filterFields, FilterFieldsTypes } from './table-filter-fields';
import { operators } from './table-filter-operators';
import { TableDataService } from '../table-data/table-data.service';
import { filter, mapTo, merge, Observable } from 'rxjs';
import { FormBuilder, FormControl, FormArray, FormGroup } from '@angular/forms';

export interface ColumnFilterValue {
  name: string;
}

export interface AllFilters {
  column: string,
  operator: string,
  values: ColumnFilterValue[]
}


@Component({
  selector: 'app-table-filter',
  templateUrl: './table-filter.component.html',
  styleUrls: ['./table-filter.component.css']
})
export class TableFilterComponent implements OnInit, AfterViewChecked {
  filterFields: any;
  table!: string;
  columns!: string[];

  idx = 0;

  myForm!: FormGroup;

  addOnBlur = true;
  readonly separatorKeysCodes = [ENTER, COMMA] as const;
  columnFilterValues: ColumnFilterValue[] = [];
  allfilters: AllFilters[] = [];

  valuesArray: FormArray[] = [];

  isLoading$!: Observable<boolean>;
  private _showLoaderEvents$!: Observable<boolean>;
  private _hideLoaderEvents$!: Observable<boolean>;

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
      filters: this.fb.array([])
    });

    const f = this.fb.group({
      column: [],
      operator: [],
      values: this.fb.array([])
    });
    this.filterForms.push(f);
    const fg = this.filterForms.at(this.filterForms.length-1) as FormGroup;
    this.valuesArray.push(fg.controls['values'] as FormArray)

    this._showLoaderEvents$ = this.router.events.pipe(
      filter((e) => e instanceof ResolveStart),
      mapTo(true)
    );
    this._hideLoaderEvents$ = this.router.events.pipe(
      filter((e) => e instanceof ResolveEnd),
      mapTo(false)
    );
    this.isLoading$ = merge(this._hideLoaderEvents$, this._showLoaderEvents$);

    this.route.params.subscribe(params => {
      this.table = params['table_name'];
      this.columns = Object.keys(filterFields[this.table]);
    });
  }

  get filterForms() {
    return this.myForm.get('filters') as FormArray
  }

  getNumberOfValuesEnterd(i: number) {
    const fg = this.filterForms.at(i) as FormGroup;
    return fg.controls['values'].value.length;
  }

  getSelectedOperator(i: number) {
    const fg = this.filterForms.at(i) as FormGroup;
    return fg.controls['operator'].value;
  }

  // get filterValueControls(): FormArray {
  //   return this.myForm.controls['0']?.controls.values as FormArray;
  // }


  allFieldsEntered(): boolean {
    return this.isFieldHasValue(this.idx, 'column') && this.isFieldHasValue(this.idx, 'operator') && this.isFieldHasValue(this.idx, 'values')
  }

  addFilter(): void {
    console.log(this.myForm.value)
    const f = this.fb.group({
      column: [],
      operator: [],
      values: this.fb.array([])
    });

    this.filterForms.push(f);
    const fg = this.filterForms.at(this.filterForms.length-1) as FormGroup;
    this.valuesArray.push(fg.controls['values'] as FormArray)
    this.idx += 1;

    // const _filter = {
    //   column: this.selectedColumn,
    //   operator: this.selectedOperator,
    //   values: this.columnFilterValues
    // }
    // this.allfilters.push(_filter);
    // console.log(this.allfilters)
  }

  deleteFilter(i: number): void {
    this.filterForms.removeAt(i);
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
    console.log('FILTER CLICKED');
    console.log(this.myForm.value);
    this.router.routeReuseStrategy.shouldReuseRoute = function () {
      return false;
    }
    this.router.onSameUrlNavigation = 'reload';
    this.tableDataService.setFilter({filter: this.showFilter()}); // Setting filter if any
    this.router.navigate([ `/table/${this.table}`]);
  }



  showFilter(): string {
    const data = this.myForm.value.filters;
    let filters = '';
    let firstDone = false;
    data.forEach((f: any) => {
      if(f.column && f.operator && f.values.length > 0) {
        if(firstDone) {
          filters += ' AND ';
        }
        filters += `${f.column} ${f.operator}`;

        firstDone = true;
        if (f.values.length > 0){
          if(!['<', '<=', '>', '>=', '=', 'starts with', 'ends with', 'contains'].includes(f.operator)) {
            filters += ' (';
          }

          let first = true;
          f.values.forEach((v: any) => {
            if(!first) {
              filters += ', ';
            }
            let quote = '';
            if(FilterFieldsTypes[f.column.toLowerCase()] === 'string') {
              quote = '"';
            }
            filters += `${quote}${v['name']}${quote}`;
            first = false;
          })
          if(!['<', '<=', '>', '>=', '=', 'starts with', 'ends with', 'contains'].includes(f.operator)) {
            filters += ') ';
          }
        }
      }
    });

    // Object.keys(this.filterFields).forEach(column => {
    //   if(this.filterFields[column]) {
    //       if(!first) {
    //         filters += ' AND ';
    //       }
    //       filters += `${column} = "${this.filterFields[column]}"`;
    //       first = false;
    //   }
    // })
    return filters || 'None';
  }
  // showFilters(): any[] {
  //   const data = this.myForm.value.filters;
  //   let filters: any[] = [];
  //   let firstDone = false;
  //   data.forEach((f: any) => {
  //     if(f.column && f.operator && f.values.length > 0) {
  //       filters.push({
  //         column: f.column,
  //         operator: f.operator,
  //         values: f.values
  //       })
  //     }
  //   })
  //   console.log(filters)
  //   return filters;
  // }
}

