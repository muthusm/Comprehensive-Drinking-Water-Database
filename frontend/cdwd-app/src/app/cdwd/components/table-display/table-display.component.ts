import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { TableDataService } from '../table-data/table-data.service';

@Component({
  selector: 'app-table-display',
  templateUrl: './table-display.component.html',
  styleUrls: ['./table-display.component.css']
})
export class TableDisplayComponent implements OnInit, OnDestroy {
  private tableFilterSub!: Subscription;
  table = '';
  isFilterView = false;
  constructor(private route: ActivatedRoute, private router: Router, private tableDataService: TableDataService) { }

  ngOnInit(): void {
    this.tableFilterSub = this.tableDataService.getClickCall()
      .subscribe(message => {
        this.isFilterView = false;
        console.log(message);
      });
    this.table = this.route.snapshot.queryParams['table'];
    this.isFilterView = this.route.snapshot.queryParams['filter'] || false;
    console.log('This table ' + this.table + ' Filter '+ this.isFilterView)
  }

  ngOnDestroy(): void {
    this.tableFilterSub.unsubscribe();
  }

  filterTable(): void {

    this.isFilterView = true;
    // this.router.routeReuseStrategy.shouldReuseRoute = function () {
    //   return false;
    // }

    // this.router.onSameUrlNavigation = 'reload';
    // this.router.navigate(['/table-filter'], { queryParams: { table: this.table } });
  }

}
