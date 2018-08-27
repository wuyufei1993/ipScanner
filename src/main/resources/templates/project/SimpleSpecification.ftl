package ${group}.system.jpa.specification;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import ${group}.system.jpa.specification.SpecificationOperator.Join;

public class SimpleSpecification<T> implements Specification<T> {

	private static final long serialVersionUID = -1882548039122367487L;
	/**
     * 查询的条件列表，是一组列表
     * */
    private List<SpecificationOperator> opers;

    public SimpleSpecification(List<SpecificationOperator> opers) {
        this.opers = opers;
    }

    @Override
    public Predicate toPredicate(Root<T> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
        int index = 0;
        //通过resultPre来组合多个条件
        Predicate resultPre = null;
        for(SpecificationOperator op:opers) {
            if(index++==0) {
                resultPre = generatePredicate(root,criteriaBuilder,op);
                continue;
            }
            Predicate pre = generatePredicate(root,criteriaBuilder,op);
            if(pre==null) continue;
            if(Join.and.name().equalsIgnoreCase(op.getJoin())) {
                resultPre = criteriaBuilder.and(resultPre,pre);
            } else if(Join.or.name().equalsIgnoreCase(op.getJoin())) {
                resultPre = criteriaBuilder.or(resultPre,pre);
            }
        }
        return resultPre;
    }

    @SuppressWarnings("unchecked")
	private Predicate generatePredicate(Root<T> root,CriteriaBuilder criteriaBuilder, SpecificationOperator op) {
        /*
        * 根据不同的操作符返回特定的查询*/
        if(SpecificationOperator.Operator.eq.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.equal(root.get(op.getKey()),op.getValue());
        } else if(SpecificationOperator.Operator.ge.name().equalsIgnoreCase(op.getOper())) {
        	return criteriaBuilder.ge(root.get(op.getKey()).as(Number.class), (Number)op.getValue());
        } else if(SpecificationOperator.Operator.le.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.le(root.get(op.getKey()).as(Number.class),(Number)op.getValue());
        } else if(SpecificationOperator.Operator.gt.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.gt(root.get(op.getKey()).as(Number.class),(Number)op.getValue());
        } else if(SpecificationOperator.Operator.lt.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.lt(root.get(op.getKey()).as(Number.class),(Number)op.getValue());
        } else if(SpecificationOperator.Operator.likeAll.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.like(root.get(op.getKey()).as(String.class),"%"+op.getValue()+"%");
        } else if(SpecificationOperator.Operator.likeL.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.like(root.get(op.getKey()).as(String.class),op.getValue()+"%");
        } else if(SpecificationOperator.Operator.likeR.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.like(root.get(op.getKey()).as(String.class),"%"+op.getValue());
        } else if(SpecificationOperator.Operator.isNull.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.isNull(root.get(op.getKey()));
        } else if(SpecificationOperator.Operator.isNotNull.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.isNotNull(root.get(op.getKey()));
        } else if(SpecificationOperator.Operator.notEqual.name().equalsIgnoreCase(op.getOper())) {
            return criteriaBuilder.notEqual(root.get(op.getKey()),op.getValue());
        }else if(SpecificationOperator.Operator.in.name().equalsIgnoreCase(op.getOper())) {
        	 List<Predicate> list = new ArrayList<>();
             List<Long> ids = (List<Long>) op.getValue();
             if (ids != null && ids.size() > 0) {
            	 In<Long> in = criteriaBuilder.in(root.get(op.getKey()));
            	 for (Long id : ids) {
            		 in.value(id);
            	}
            	 list.add(in);
             }
             Predicate[] p = new Predicate[list.size()];
             return criteriaBuilder.and(list.toArray(p));
        }else if(SpecificationOperator.Operator.greaterThanOrEqualTo4Date.name().equalsIgnoreCase(op.getOper())) {
        	return criteriaBuilder.greaterThanOrEqualTo(root.get(op.getKey()),(Date)op.getValue());
        }else if(SpecificationOperator.Operator.lessThanOrEqualTo4Date.name().equalsIgnoreCase(op.getOper())) {
        	return criteriaBuilder.lessThanOrEqualTo(root.get(op.getKey()),(Date)op.getValue());
        }else if(SpecificationOperator.Operator.greaterThanOrEqualToString.name().equalsIgnoreCase(op.getOper())) {
        	return criteriaBuilder.greaterThanOrEqualTo(root.get(op.getKey()),(String)op.getValue());
        }else if(SpecificationOperator.Operator.lessThanOrEqualToString.name().equalsIgnoreCase(op.getOper())) {
        	return criteriaBuilder.lessThanOrEqualTo(root.get(op.getKey()),(String)op.getValue());
        }else if(SpecificationOperator.Operator.inStr.name().equalsIgnoreCase(op.getOper())){
        	 List<Predicate> list = new ArrayList<>();
             List<String> ids = (List<String>) op.getValue();
             if (ids != null && ids.size() > 0) {
            	 In<String> in = criteriaBuilder.in(root.get(op.getKey()));
            	 for (String id : ids) {
            		 in.value(id);
            	}
            	 list.add(in);
             }
             Predicate[] p = new Predicate[list.size()];
             return criteriaBuilder.and(list.toArray(p));
        }else if(SpecificationOperator.Operator.inEntity.name().equalsIgnoreCase(op.getOper())) {
        	List<Predicate> list = new ArrayList<>();
            List<T> ids = (List<T>) op.getValue();
            if (ids != null && ids.size() > 0) {
           	 In<T> in = criteriaBuilder.in(root.get(op.getKey()));
           	 for (T id : ids) {
           		 in.value(id);
           	}
           	 list.add(in);
            }
            Predicate[] p = new Predicate[list.size()];
            return criteriaBuilder.and(list.toArray(p));
        }
        return null;
    }

}