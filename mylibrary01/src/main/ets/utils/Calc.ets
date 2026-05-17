export function add(a: number, b: number) {
  return a + b;
}
export class  Emp{
  eid:number
  ename:string

   constructor(eid: number, ename: string) {
     this.eid = eid;
     this.ename = ename;
   }

 }

export  let e1 =  new Emp(999,"tom")