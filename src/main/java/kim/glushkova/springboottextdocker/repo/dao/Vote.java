package kim.glushkova.springboottextdocker.repo.dao;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

/**
 *
 */
@Data
@Builder
@ToString
public class Vote {
  private String id;
  private long votingId;
  private String answerId;
}
